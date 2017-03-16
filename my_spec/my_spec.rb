require_relative '../double_trans_cipher'
require 'minitest/autorun'

describe 'Using Double Transposition Caesar cipher' do
  before do
    @cc = 'I have an apple.'
    @key = [[3, 2, 1], [2, 3, 1]]
  end
  it 'should encrypt card information' do
    enc = DoubleTranspositionCipher.encrypt(@cc, @key)
    enc.wont_equal @cc.to_s
    enc.wont_be_nil
  end
  it 'should decrypt text' do
    enc = DoubleTranspositionCipher.encrypt(@cc, @key)
    dec = DoubleTranspositionCipher.decrypt(enc, @key)
    dec.must_equal @cc.to_s
  end
end