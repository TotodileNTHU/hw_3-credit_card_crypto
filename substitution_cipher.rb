module SubstitutionCipher
  module Caesar
  # Encrypts document using key
  # Arguments:
  #   document: String
  #   key: Fixnum (integer)
  # Returns: String
  @az_map = []
  26.times do |i|  # origin : az_map = 26.times do |i|  , correct: 26.times do |i|
    @az_map.push( ('a'.ord + i).chr )
  end

  def self.encrypt(document, key)
    # TODO: encrypt string using caesar cipher
    encript_doc = document.split('').map do |e|
      @az_map[@az_map.index(e) - key]
    end
    encript_doc = encript_doc.join
  end

  # Decrypts String document using integer key
  # Arguments:
  #   document: String
  #   key: Fixnum (integer)
  # Returns: String
  def self.decrypt(document, key)
    # TODO: decrypt string using caesar cipher
    decript_doc = document.split('').map do |e|
      idx = @az_map.index(e) + key
      idx = idx > 25 ? idx-26 : idx
      @az_map[idx]
    end
    decript_doc = decript_doc.join
  end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
    end
  end
end
