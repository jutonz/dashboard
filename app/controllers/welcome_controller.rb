class WelcomeController < ApplicationController
  def index
    @tile_notes = tile_notes
  end

  def tile_notes
    _tile_notes = Array.new
    number_of_notes_displayed = [Note.all.size, 3].min
    number_of_notes_displayed.times do |x|
      _tile_notes.push Note.all.reverse[x]
    end
    return _tile_notes
  end
end
