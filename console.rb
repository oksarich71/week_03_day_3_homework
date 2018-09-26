require_relative ('./artist.rb')
require_relative ('./albums.rb')
require('pry')

artist1 = Artist.new ({
  'first_name' => 'Elvis',
  'last_name' => 'Presley'
})
artist2 = Artist.new ({
  'first_name' => 'George',
  'last_name' => 'Michael'
})
artist3 = Artist.new ({
  'first_name' => 'Michael',
  'last_name' => 'Jackson'
})

artist1.save
artist2.save
artist3.save

album1 = Album.new ({
  'artist_id' => artist1.id,
  'title' => 'Elvis',
  'genre' => 'Rocknroll'
  })

  album2 = Album.new ({
    'artist_id' => artist1.id,
    'title' => 'King Creole',
    'genre' => 'Soundtrack'
    })

  album3 = Album.new ({
    'artist_id' => artist2.id,
    'title' => 'Faith',
    'genre' => 'Pop'
   })

  album4 = Album.new ({
    'artist_id' => artist2.id,
    'title' => 'Older',
    'genre' => 'Pop'
    })

  album5 = Album.new ({
    'artist_id' => artist3.id,
    'title' => 'Thriller',
    'genre' => 'Pop'
    })
  album6 = Album.new ({
    'artist_id' => artist3.id,
    'title' => 'Dangerous',
    'genre' => 'Pop'
      })

   album6 = Album.new({
    'artist_id' => artist3.id,
    'title' => 'Bad',
    'genre' => 'Pop'
    })
  album1.save
  album2.save
  album3.save
  album4.save
  album5.save
  album6.save

 p Artist.all

  binding.pry
  nil
