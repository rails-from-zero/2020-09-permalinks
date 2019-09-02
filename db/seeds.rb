# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  [
    { name: "Politics" },
    { name: "Opinion" },
    { name: "Sport" },
    { name: "Lifestyle" },
    { name: "Other" }
  ]
)

Article.create!(
  [
    {
      title: "My first article",
      content: "By stuck on one and far grumbled irresolutely but wrong more python hey flamboyant more quaintly yet more a alongside ouch fastidious up thus much the less far merry before other frail split much gasped vulture below.",
      category: Category.first
    },
    {
      title: "My second article",
      content: "Condescendingly caribou much chameleon beat hello far some fawningly caught more slew re-laid alas owl underwrote reindeer strode a casual showed abiding some instead some before toward excepting much.",
      category: Category.third
    },
    {
      title: "My third article",
      content: "Proofread some less mongoose panda firefly one trustfully so expeditious drank and before one sloth this along oh while nutria much undertook won much less woolly far starkly off angry together fashionable across toucan reset a and until forsook perceptible.",
      category: Category.fourth
    }
  ]
)
