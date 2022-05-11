20.times do |i|
  Event.create(
    owner_id: 1,
    name: "イベント#{ i }",
    start_at: Time.current.since("#{ i + 3 }".to_i.days),
    end_at: Time.current.since("#{ i + 4 }".to_i.days),
    place: "開催場所#{ i }"
  )
end