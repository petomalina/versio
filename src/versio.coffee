# @author Gelidus
# @version 1.0.0
module.exports = Versio = {
  # note: 'f' is first, 's' is second, 'v' is version

  toArray: (v) ->
    return v.split('.')

  same: (f, s) ->
    return Versio.diff(f, s) is 0

  # implementation of operation <
  lower: (f, s) ->
    return Versio.diff(f, s) < 0

  # implementation of operation >
  higher: (f, s) ->
    return Versio.diff(f, s) > 0

  # @return > 1 when higher, 0 same, < 1 lower
  diff: (f, s) ->
    dt = Versio.delta(f, s)

    for d in dt
      if d isnt 0
        return d

    return 0

  # @return array of diffs
  delta: (f, s) ->
    fver = Versio.toArray(f)
    sver = Versio.toArray(s)

    if fver.length isnt sver.length
      throw Error("Lengths of versions are not same")

    res = []

    for i in [0...fver.length]
      if (fver[i] is 'x' or sver[i] is 'x')
        res.push(0)
      else
        res.push(parseInt(fver[i], 10) - parseInt(sver[i], 10))

    return res
}
