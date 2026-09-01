# Create mock users
10.times do |i|
  User.find_or_create_by!(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    phone: "1380000#{sprintf('%04d', i + 1)}",
    address: "#{i + 1} Example Street, City #{i + 1}"
  )
end

# Create mock information entries
categories = ['Announcement', 'News', 'Notice', 'Document', 'Guide']
statuses = ['Draft', 'Published', 'Archived']
authors = User.pluck(:name)

20.times do |i|
  Information.find_or_create_by!(
    title: "Information Title #{i + 1}",
    content: "This is the detailed content for information entry #{i + 1}. It contains important information for reference and management purposes.",
    category: categories.sample,
    author: authors.sample,
    status: statuses.sample
  )
end

puts "Seeded #{User.count} users and #{Information.count} information entries successfully!"
