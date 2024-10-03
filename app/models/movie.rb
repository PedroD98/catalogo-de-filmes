class Movie < ApplicationRecord
  mount_uploader :poster, PosterUploader

  enum :release_status, { upcoming: 0, released: 1 }
  enum :status, { draft: 0, published: 1 }

  belongs_to :genre
  belongs_to :director

  def translate_release_status
    return "Já lançado" if release_status == "released"
    "A ser lançado"
  end

  def translate_status
    return "Rascunho" if status == "draft"
    "Publicado"
  end
end
