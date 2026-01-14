package js.lib;

@:native('BigInt')
@:coreType extern abstract BigInt {
    @:op(a + b) static function add(a:BigInt, b:BigInt):BigInt;
    @:op(a - b) static function sub(a:BigInt, b:BigInt):BigInt;
    @:op(a * b) static function mul(a:BigInt, b:BigInt):BigInt;
    @:op(a / b) static function div(a:BigInt, b:BigInt):BigInt;
    @:op(a % b) static function mod(a:BigInt, b:BigInt):BigInt;

    @:op(a < b) static function lt(a:BigInt, b:BigInt):Bool;
    @:op(a > b) static function gt(a:BigInt, b:BigInt):Bool;
    @:op(a <= b) static function lte(a:BigInt, b:BigInt):Bool;
    @:op(a >= b) static function gte(a:BigInt, b:BigInt):Bool;
    @:op(a == b) static function eq(a:BigInt, b:BigInt):Bool;
    @:op(a != b) static function neq(a:BigInt, b:BigInt):Bool;

    @:op(a & b) static function and(a:BigInt, b:BigInt):BigInt;
    @:op(a | b) static function or(a:BigInt, b:BigInt):BigInt;
    @:op(a ^ b) static function xor(a:BigInt, b:BigInt):BigInt;
    @:op(~a) static function not(a:BigInt):BigInt;
    @:op(a << b) static function shl(a:BigInt, b:BigInt):BigInt;
    @:op(a >> b) static function shr(a:BigInt, b:BigInt):BigInt;
    @:op(a >>> b) static function ushr(a:BigInt, b:BigInt):BigInt;

    public inline function toInt():Int return (untyped Number)(this);

    public inline function lo() return asIntN(32, this);
    public inline function hi() return asIntN(32, this >> 32);

    @:to inline function toString():String return (cast this:Dynamic).toString();

    /**
        Use to make a BigInt literal. Will crash at runtime if the number is not an integer.
    **/
    static inline function literal(i:Float):BigInt {
        return js.Syntax.code('{0}n', i);
    }

    static function asIntN(bits:Int, num:BigInt):BigInt;
    static function asUintN(bits:Int, num:BigInt):BigInt;

    @:selfCall static function ofString(str:String):BigInt;
    @:selfCall @:from static function ofInt(num:Int):BigInt;
    @:from static inline function ofInt64(num:haxe.Int64):BigInt
        return ofInts(num.high, num.low);

    static inline function ofInts(hi:Int, lo:Int):BigInt 
        return asIntN(64, (ofInt(hi) << literal(32)) | ofInt(lo >>> 0));
}