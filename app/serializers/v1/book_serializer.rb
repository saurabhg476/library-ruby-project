class V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :weight, :publisher, :language, :pages, :publication_date

  def publication_date
  	object.publication_date.strftime "%Y-%m-%d"
  end
end
