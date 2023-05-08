part of sunoom;

class PairOfFirstJdnNov {
  final double previous;
  final double current;
  PairOfFirstJdnNov(this.current, this.previous);

  factory PairOfFirstJdnNov.getPairOfFirstJdn(
      int gregorianYear, TimeZone timeZone) {
    var prevJdn = firstJdnInNov(gregorianYear - 1, timeZone.offsetInHour);
    var currentJdn = firstJdnInNov(gregorianYear, timeZone.offsetInHour);
    prevJdn = shiftJdnTo0hLocal(prevJdn, timeZone);
    currentJdn = shiftJdnTo0hLocal(currentJdn, timeZone);
    return PairOfFirstJdnNov(currentJdn, prevJdn);
  }
}
