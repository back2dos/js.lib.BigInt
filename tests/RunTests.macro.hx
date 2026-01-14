import haxe.macro.Expr;

using haxe.macro.Tools;

class RunTests {
    static function assert(e:Expr) {
        var msg = e.toString();
        return macro _assert($e, $v{e.toString()});
    }
}