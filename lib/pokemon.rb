class Pokemon
    attr_accessor :id, :name, :type, :db

    # I originally put nil, why isn't it required
    # How are we supposed to know when to use id vs id:
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        # Why is id now not a required return?
        # Why does this save method take in arguements whereas
        # in the previous lab we did not have to do this
    end
    # I originally didn't include db
    def self.find(id, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end
end
