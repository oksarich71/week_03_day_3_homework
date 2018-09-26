require('pg')
require_relative('../homework/sql_runner.rb')

class Album

  attr_accessor(:title, :genre)
  attr_reader(:id, :artist_id)

  def initialize(options)
    @id = options['id'].to_i()
    @artist_id = options['artist_id'].to_i()
    @title = options['title']
    @genre = options['genre']
  end

  def save()
      sql = "INSERT INTO albums (
          artist_id,
          title,
          genre
        )
        VALUES ($1, $2, $3)
        RETURNING id;"

      values = [@artist_id, @title, @qenre]
      result = SqlRunner.run(sql, values)

      result_hash = result[0]
      string_id = result_hash['id']
      id = string_id.to_i()
      @id = id
     end

     def self.all()
       sql = "SELECT * FROM albums;"
       albums_hashes = SqlRunner.run(sql)
       albums_objects = albums_hashes.map do |albums_hash|
         Album.new(albums_hash)
       end
       return albums_objects
     end 

end
