module DoubleTranspositionCipher
  # TODO: FILL THIS IN!
  ## Suggested steps for double transposition cipher
  # 1. find number of rows/cols such that matrix is almost square
  # 2. break plaintext into evenly sized blocks
  # 3. sort rows in predictibly random way using key as seed
  # 4. sort columns of each row in predictibly random way
  # 5. return joined cyphertext
  def self.encrypt(document, key)
    document = document.to_s
    width = Math.sqrt(document.length).ceil
    height = (document.length.to_f / width).ceil
    key_map_col = (0...width).to_a.shuffle(random:Random.new(key))
    key_map_row = (0...height).to_a.shuffle(random:Random.new(key))
    doc_array = document.scan(/.{1,#{width}}/)
    last_row_length = doc_array[-1].length
    if last_row_length != width
      fill_dummy_size = width - last_row_length
      after_filling = doc_array[-1].concat('~' * fill_dummy_size)
      doc_array[-1] = after_filling
    end

    chs = doc_array.join.chars
    enc = Array.new(width * height)

    for i in 0...height
      for j in 0...width
        enc[i * width + j] = chs[key_map_row[i] * width + key_map_col[j]]
      end
    end
    enc.join
  end

  def self.decrypt(ciphertext, key)
    ciphertext = ciphertext.to_s
    width = Math.sqrt(ciphertext.length).ceil
    height = (ciphertext.length.to_f / width).ceil
    chs = Array.new(width * height)
    key_map_col = (0...width).to_a.shuffle(random: Random.new(key))
    key_map_row = (0...height).to_a.shuffle(random: Random.new(key))
    for i in 0...height
      for j in 0...width
        c = ciphertext.chars[i * width + j]
        id = key_map_row[i] * width + key_map_col[j]
        chs[id] = c unless c == '~'
      end
    end
    chs.join
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
