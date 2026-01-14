package ;

import js.lib.BigInt;

class RunTests {
  static var total = 0;
  static var passed = 0;
  static function _assert(v:Bool, msg:String) {
    total++;
    if (v) {
      travix.Logger.println('(✓) $msg');
      passed++;
    }
    else travix.Logger.println('(✗) $msg');
  }
  static macro function assert();
  static function main() {
    
    var i = BigInt.literal(10_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000);
    
    assert(i.toString() == '10000000000000000000000000000000000000000000000000');

    assert(BigInt.asIntN(64, i).toString() == '-537617205517352960');
    assert(BigInt.asUintN(64, i).toString() == '17909126868192198656');
    
    i = BigInt.ofString("0o123");

    assert(i.toString() == '83');
    
    var i64 = 10_000_000_000i64;
    var i2:BigInt = 10_000_000_000i64;

    assert(i64.low == i2.lo());
    assert(i64.high == i2.hi());

    i = BigInt.literal(10_000_000_000);

    assert(i == i2);
    assert(js.Lib.typeof(i - i2) == 'bigint');
    assert(i - i2 == 0);

    travix.Logger.println('\nPassed $passed/$total tests');
    
    travix.Logger.exit(if (passed == total) 0 else 1); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}