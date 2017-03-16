# DoubleTranspositionCipher
module DoubleTranspositionCipher
  ## Suggested steps for double transposition cipher
  # 1. find number of rows/cols such that matrix is almost square
  # 2. break plaintext into evenly sized blocks
  # 3. sort rows in predictibly random way using key as seed
  # 4. sort columns of each row in predictibly random way
  # 5. return joined cyphertext
  def self.get_filling(document, width)
    remainder = document.length % width
    document += ('~' * (width - remainder)) if remainder != 0
    document
  end

  def self.get_enc(chs, width, height, key_map_col, key_map_row)
    enc = Array.new(width * height)
    for i in 0...height
      for j in 0...width
        enc[i * width + j] = chs[key_map_row[i] * width + key_map_col[j]]
      end
    end
    enc.join
  end

  def self.encrypt(document, key)
    document = document.to_s
    width = Math.sqrt(document.length).ceil
    height = (document.length.to_f / width).ceil
    key_map_col = (0...width).to_a.shuffle(random: Random.new(key))
    key_map_row = (0...height).to_a.shuffle(random: Random.new(key))
    doc_with_filling = get_filling(document, width)
    get_enc(doc_with_filling, width, height, key_map_col, key_map_row)
  end

  def self.get_dec(ciphertext, width, height, key_map_col, key_map_row)
    chs = Array.new(width * height)
    for i in 0...height
      for j in 0...width
        c = ciphertext.chars[i * width + j]
        id = key_map_row[i] * width + key_map_col[j]
        chs[id] = c unless c == '~'
      end
    end
    chs.join
  end

  def self.decrypt(ciphertext, key)
    ciphertext = ciphertext.to_s
    width = Math.sqrt(ciphertext.length).ceil
    height = (ciphertext.length.to_f / width).ceil
    key_map_col = (0...width).to_a.shuffle(random: Random.new(key))
    key_map_row = (0...height).to_a.shuffle(random: Random.new(key))
    get_dec(ciphertext, width, height, key_map_col, key_map_row)
  end
end

# doc = 'abcd1234567890efgh'
# puts "doch = #{doc}"
# key = 123
# enc = DoubleTranspositionCipher::encrypt(doc, key)
# puts "enc.length = #{enc.length}"
# puts
# puts "call decrypt()"
# dec = DoubleTranspositionCipher::decrypt(enc, 3)
# puts "dec.length = #{dec.length}"
