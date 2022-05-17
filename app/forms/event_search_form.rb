class EventSearchForm
  include ActiveModel::Model # モデルとして必要な振る舞いを追加
  include ActiveModel::Attributes # attributeメソッドを利用するため追加, モデルの属性のkeywordとpageをattributeメソッドでそれぞれのゲッターとセッターを追加

  attribute :keyword, :string
  attribute :page, :integer

  def search
    Event.search( # searchメソッドはsearchkickで検索する時のメソッド
      keyword_for_search,
      where: { start_at: { gt: start_at } },
      page: page,
      per_page: 10
    )
  end

  def start_at # フォームからの入力がない時に現在時刻をデフォルト値にするため、start_at属性のゲッターを用意
    @start_at || Time.current
  end

  def start_at=(new_start_at) # フォームから文字列で入力された日時をActiveSupport::TimeWithZoneオブジェクトにするようなstart_at属性のセッターを用意
    @start_at = new_start_at.in_time_zone
  end

  private

  def keyword_for_search # '*'で検索すると全ての検索結果が表示されるので、何も入力がない時は'*'で検索するようにする
    keyword.presence || '*'
  end
end