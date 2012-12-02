lodash = require 'lodash'
chai = require 'chai'
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chaiBackbone = require 'chai-backbone'
chai.use sinonChai
chai.use chaiBackbone

module.exports =
  chai: chai
  expect: chai.expect
  sinon: sinon
  _: lodash
