class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(poke_hash)
    @id = poke_hash[:id]
    @name = poke_hash[:name]
    @type = poke_hash[:type]
    @db = poke_hash[:db]
    @hp = nil
    @hp ||= poke_hash[:hp]
    @@all << self
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, id)
  end

  def self.all
    @@ll
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    newPoke = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    #binding.pry
    newPokehash = {id: newPoke[0], name: newPoke[1], type: newPoke[2], hp: newPoke[3], db: db}
    self.new(newPokehash)
  end

end
