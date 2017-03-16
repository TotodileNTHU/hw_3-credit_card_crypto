module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    len = document.length
    # ex: len = 16, rows = 4, cols = 4
    #.    len = 20, rows = 4, cols = 5    
    rows = Math.sqrt(len).floor
    cols = Math.sqrt(len).ceil
    
    # ex: document = 'I have an apple.'
    #     blocks = ["I ha", "ve a", "n ap", "ple"]
    blocks = document.to_s.scan(/.{1,#{cols}}/)

    # key = [3, 1, 2]
    # sorted_blocks = ["n ap", "I ha", "ve a"]
    # if key.length < blocks.length 
    # need to be add the ones which are left in the block
    # that is     ------>   "ple"
    sorted_blocks = []
    key.each do |key|
      sorted_blocks.push(blocks[key-1])
    end
    
    blocks.length - key.length 
    



    puts " "
    puts rows
    puts cols
    puts " "
    puts blocks

    return document
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    return ciphertext
  end
end
