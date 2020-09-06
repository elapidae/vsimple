# VLOG -- Логгирование действий в программах и модулях.

2019-11-15
TODO: Текст сильно устарел, надо вычитывать и переписывать.

UPD 20-07-2018 Этот файл был написан раньше, часть устарела. Но основная мысль осталась.


## Идеология и замысел
Процесс непосредственно логгирования отделен от процесса вывода/записи/отправки логов.
В том смысле, что при логгировании событий программист вообще не должен задумываться
куда/как/сколько/когда/почему эти логи попадут. Все логи выводятся через одну точку,
в которой они могут быть запротоколированы любыми способами.

> Зачем?

Чтобы можно было логгировать в модулях, без подключения библиотек логгирования,
см. ["инверсия зависимостей"](http://www.skipy.ru/architecture/module_design.html#principles).


## Процесс логгирования:

NB! В папке логгера вложены примеры для qt и cmake
(`vlibs/vlog/vlog_qt_examle` и `vlibs/vlog/vlog_cmake_example`).

***

К проектам лог подключается достаточно "сложно":

* qt :
```
VLIBS_DIR = path/to/this/repo
include( $$VLIBS_DIR/vlog/vlog.pri )        # Здесь сама система сбора логов.
include( $$VLIBS_DIR/vlog/vfilelog.pri )    # Здесь файловый логгер "из коробки".
                                            # Если включен, vlog.pri не нужен.
```

* cmake (заголовки и исходные файлы будут добавлены в пары переменных
`V_HEADERS, V_SOURCES`.
```
set( VLIBS_PATH, "path/to/this/repo" )
include( "${VLIBS_PATH}/vlog/vlog.cmake" )
include( "${VLIBS_PATH}/vlog/vfilelog.cmake" )
```


Для логгирования необходимо включить в исходник:
```
#include "vlog.h"
```

Логгирование производится через макросы:
```
    VTRACE("Трассировка при непонятках");
    VDEBUG("Что там лежит в переменной", some_var);

    VRUNLOG  << "Инициализация успешна, приступаем к работе.";
    VWARNING << "Марсеане негодуэ!";

    VFATAL << "Все пропало, гипс снимают!!!";
```
Как видно из примера, можно пихать аргументы как через оператор <<, так и через
оператор () с произвольным количеством аргументов.

Т.е. разрешены такие конструкции как:
```
    int ii;
    double dd;
    string ss;
    float ff;

    // будет работать при включении проекта vchrono и заголовка #include "vtimepoint.h"
    chrono::milliseconds ms;

    VTRACE("text", ii, dd, ss, ms);
    VDEBUG("text")(ii)(dd, ss)(ms);
    VRUNLOG << "text" << ii << dd << ss << ms;
```

***
Действуют все стандартные модификаторы
(их как грязи, см. [здесь](http://en.cppreference.com/w/cpp/io/manip) и в модуле vcat),
часть из них вынесена в отдельные методы:
```
    VDEBUG
        .max_presicion()(dd)
        .presicion(4)(ff)
        .hex()(ii)
        (std::oct, ii);
```
NB! Добавлен модификатор vcat::space, vcat::nospace, включающий пробелы между аргументами.
Притом он ВКЛЮЧЕН ПО УМОЛЧАНИЮ. Также есть соответствующие перегруженные методы:
`VFATAL.nospace() << "Filename '" << fname << "' does not exists!";`
В примере выше, если не выключить пробелы, имя файла окажется не в кавычках,
будут пробелы между ними.

***
Для себя, я сделал header "vlog_pretty.h", повторяющий те же макросы в нижнем регистре.
Также есть class VError : public std::exception, который можно использовать для бросания исключений:
```
    if ( some_error )
        throw verror << "Some problem";
```
Метод what(), кроме сообщения, будет содержать точку, где было брошено исключение в виде:
[source.cpp:42:function] >> "Some problem";

## "Под капотом". Процесс записи, пересылки, составления и обработки логов.

При создании точки логгирования, создается класс VLogger, имеющий
интерфейс vcat (см. соотв. модуль).
Когда он уничтожается, он формирует "точку вхождения" -- класс `VLogEntry`, который
передается всем зарегистрированным исполнителям логов через статический метод `vlog::VLogger::execute()`.

"Исполнитель логов" (или просто "исполнитель") означает функциональную сущность типа
```
        using Executer = std::function< void(const VLogEntry & entry) >;
```
По умолчанию, "из коробки", в исполнителях логов находится один, логгирующий данные
в консоль (через метод `VLogger::log_to_cout_cerr( const VLogEntry &entry )`);


В классе `vlog::VLogger` есть статические методы:
```
        static void add_executer( Executer e );
        static void clear_executers();
```
которые позволяют добавлять своих исполнителей, а также сбрасывать всех исполнителей
разом (делать селекционное отключение нет смысла, просто настраивайте один раз).

Написаны исполнители логов в файлы с ротацией, для их использования надо подключить:
`include( $$VLibs_Dir/vlog/vfilelog.pri )`
Есть вариант логгирования в один файл, в файлы по типу сообщения;
Есть исполнители в отдельном потоке, или без потокобезопасности.

NB! Если программист логгирует всякую муру и забил очередь потока -- это ЕГО проблемы!
На крайний случай, в классах V*FileLog_Threaded есть метод `int queued_entries() const;`,
через который можно мониторить забитость очереди.


Пример:
```
#include "vlog.h"
#include "vfilelog.h"

using namespace std;

//=======================================================================================
//  Пример-затравка для пользовательской обработки логов.
void my_log_executer( const vlog::VLogEntry &entry )
{
    // Ниже приведены содержания из точки логгирования.
    // Их следует использовать для составления собственных сообщений.

    entry.char_type();  // Однобуквенный код типа сообщения. { T, D, R, W, F }
    entry.str_type();   // Трехбуквенный код типа сообщения { Trc, Dbg, Run, Wrn, Ftl }.
    entry.type();       // Тип enum class vlog::VLogEntry::Type.

    entry.filename();   // Имя файла без пути до него.
    entry.filepath();   // Полное имя файла (то, что дает __FILE__).
    entry.line();       // Номер строки в исходнике __LINE__
    entry.funcname();   // Что дает __PRETTY_FUNCTION__.

    entry.message();    // Составленное сообщение.
    entry.timestamp();  // Метка времени с места логгирования.

    entry.is_fatal();   // Флаг неприятного сообщения. Может захотите сделать exit();

    cout << "my_log_executer: " << entry.message() << endl;
}
//=======================================================================================
int main( int, char **argv )
{
    // Удалим текущие логгеры и будем писать только в файлы.
    VLogger::clear_executers();

    // Сами будем логгировать...
    VLogger::add_executer( my_log_executer );

    // Будем вести историю максимум в двух файлах, размеры одного -- 2.5 кб.
    vlog::VOneFileLog one_flog( vcat(argv[0], ".log"), 2500, 2 );
    one_flog.register_self(); // Он сам знает где и как регистрироваться.

    // Будем вести историю максимум в двух файлах, размеры одного -- 1 кб.
    // Папка будет создана (если это возможно).
    vlog::VGroupFileLog group_flog( "./logs", 1000, 2 );
    group_flog.register_self();

    for (int i = 0; i < 10; ++i)
    {
        auto msg = vcat("Testing records in file: ", i)
                       (", timestamp = ", VTimePoint::now());
        VTRACE   (msg);
        VDEBUG   (msg);
        VRUNLOG  (msg);
        VWARNING (msg);
        VFATAL   (msg);
    }
    // См. логи в папке программы.

    return 0;
}
//=======================================================================================
```