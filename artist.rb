require('pg')
require_relative('../homework/sql_runner.rb')

class Artist

  attr_accessor(:first_name, :last_name)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO artists (
        first_name,
        last_name
        )
      VALUES ($1, $2)
      RETURNING id;"

    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)

    result_hash = result[0]
    string_id = result_hash['id']
    id = string_id.to_i()
    @id = id
   end

   def self.all()
     sql = "SELECT * FROM artists;"
     artists_hashes = SqlRunner.run(sql)
     artists_objects = artists_hashes.map do |artists_hash|
       Artist.new(artists_hash)
     end
     return artists_objects
   end

   def albums()
    # we have @id
    sql = 'SELECT * FROM albums WHERE artist_id = $1;'
    results = SqlRunner.run(sql, [@id])
    albums = results.map do |albums_hash|
      Album.new(albums_hash)
    end
    return albums
    end

    def update()
     sql = "UPDATE artists SET (first_name, last_name) = ($1, $2) WHERE id = $3;"
     values = [@first_name, @last_name, @id]
     SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM artists WHERE id = $1"
      result = SqlRunner.run(sql, [id])
      artist_hash = result[0]
      artist_object = Artist.new(artist_hash)
      return artist_object
    end

    def self.delete(id)
       sql = "DELETE FROM artists WHERE id = $1"
       result = SqlRunner.run(sql, [id])
     end
end
