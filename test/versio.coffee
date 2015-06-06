require("should")
Versio = require("../lib/versio")

describe "vesio", () ->

  it "should convert version into array", () ->
    Versio.toArray("1.2.3").should.be.eql(["1", "2", "3"])
    Versio.toArray("1.2.33").should.be.eql(["1", "2", "33"])
    Versio.toArray("1.2.x").should.be.eql(["1", "2", "x"])

  it "should calculate delta of versions", () ->
    Versio.delta("1.2.3", "1.2.2").should.be.eql([0, 0, 1])
    Versio.delta("0.2.4", "1.0.7").should.be.eql([-1, 2, -3])
    Versio.delta("1.2.x", "0.1.5").should.be.eql([1, 1, 0])

  it "should diff two versions", () ->
    Versio.diff("1.2.3", "0.3.4").should.be.eql(1)
    Versio.diff("x.x.x", "5.6.7").should.be.eql(0)
    Versio.diff("1.2.4", "1.2.3").should.be.eql(1)
    Versio.diff("1.2.2", "1.2.3").should.be.eql(-1)
    Versio.diff("1.2.x", "2.2.x").should.be.eql(-1)

  it "should calculate same versions", () ->
    Versio.same("1.2.3", "1.2.3").should.be.true
    Versio.same("1.2.4", "1.2.3").should.be.false
    Versio.same("1.2.x", "1.2.7").should.be.true
    Versio.same("1.x.x", "2.6.7").should.be.false
    Versio.same("1.x.x", "1.6.3").should.be.true

  it "should calculate lower versions", () ->
    Versio.lower("1.2.3", "1.2.4").should.be.true
    Versio.lower("1.6.7", "1.3.8").should.be.false
    Versio.lower("1.4.2", "1.5.2").should.be.true

  it "should calculate higher versions", () ->
    Versio.higher("1.2.3", "1.2.2").should.be.true
    Versio.higher("1.4.5", "1.3.5").should.be.true
    Versio.higher("1.3.4", "1.5.2").should.be.false
    Versio.higher("1.2.x", "1.3.x").should.be.false
    Versio.higher("1.2.3", "1.2.3").should.be.false
