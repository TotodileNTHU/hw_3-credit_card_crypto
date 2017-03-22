require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher.rb'
require_relative '../sk_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end

  describe 'Using metaprogramming' do
    [SubstitutionCipher::Caesar, SubstitutionCipher::Permutation, DoubleTranspositionCipher].each do |cipher|
      describe 'Using ' + cipher.to_s do
        it 'should encrypt card information' do
          enc = cipher.encrypt(@cc, @key)
          enc.wont_equal @cc.to_s
          enc.wont_be_nil
        end
    
        it 'should decrypt text' do
          enc = cipher.encrypt(@cc, @key)
          dec = cipher.decrypt(enc, @key)
          dec.must_equal @cc.to_s
        end
      end 
    end
  end

  # it 'should generate new Base64 keys'
  # it 'should generate different keys each time'
  # it 'should encrypt credit card objects'
  # it 'should decrypt encrypted credit card objects'
  # it 'should not replay the same encryption twice'
  # it 'should not yield depth in encryption'

  describe 'Using Modern Symmetric Key Cipher' do
    it 'should generate new Base64 keys' do
      key = ModernSymmetricCipher.generate_new_key
      key.wont_be_nil
    end

    it 'should generate different keys each time' do
      key1 = ModernSymmetricCipher.generate_new_key
      key2 = ModernSymmetricCipher.generate_new_key
      key1.wont_equal key2
    end
    
    it 'should encrypt credit card objects' do
      key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end
    
    it 'should decrypt encrypted credit card objects' do
      key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      dec = ModernSymmetricCipher.decrypt(enc, key)
      dec.must_equal @cc.to_s
    end
    
    it 'should not replay the same encryption twice' do
      key  = ModernSymmetricCipher.generate_new_key
      enc1 = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      enc2 = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      enc1.wont_equal enc2
    end
    
    it 'should not yield depth in encryption' do
      key  = ModernSymmetricCipher.generate_new_key
      enc1 = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      enc2 = ModernSymmetricCipher.encrypt(@cc.to_s, key)
      enc1.wont_equal enc2
    end
  end
  
  
end
