require 'date'
require_relative '../classes/music_album'

describe MusicAlbum do
  let(:params) do
    {
      id: 1,
      genre: 'Rock',
      author: 'Artist Name',
      label: 'Record Label',
      publish_date: '2000-01-01',
      on_spotify: true,
      archived: false
    }
  end
  let(:music_album) { MusicAlbum.new(params) }

  describe '#initialize' do
    it 'should set the attributes correctly' do
      expect(music_album.id).to eq(1)
      expect(music_album.genre).to eq('Rock')
      expect(music_album.author).to eq('Artist Name')
      expect(music_album.label).to eq('Record Label')
      expect(music_album.publish_date).to eq(Date.parse('2000-01-01'))
      expect(music_album.on_spotify).to eq(true)
      expect(music_album.archived).to eq(false)
    end
  end

  describe '#move_to_archive' do
    context 'when album is eligible for archiving' do
      it 'should set the archived attribute to true' do
        # Assuming today's date is more than 10 years after the publish date
        allow(Date).to receive(:today).and_return(Date.parse('2011-01-01'))
        music_album.move_to_archive
        expect(music_album.archived).to eq(true)
      end
    end

    context 'when album is not eligible for archiving' do
      it 'should not set the archived attribute to true' do
        # Assuming today's date is less than 10 years after the publish date
        allow(Date).to receive(:today).and_return(Date.parse('2005-01-01'))
        music_album.move_to_archive
        expect(music_album.archived).to eq(false)
      end
    end
  end
end
