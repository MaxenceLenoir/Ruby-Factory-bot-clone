RSpec.describe TinyFactory do
  prepend TinyFactory::Syntax::Methods

  it "has a version number" do
    expect(TinyFactory::VERSION).not_to be nil
  end

  before do
    TinyFactory.define :user do
      first_name { "Maxence" }
      last_name { "Lenoir" }
      email { "#{first_name}@hey.com".downcase }
    end
  end

  it "test_attributes_for" do
    attributes = attributes_for(:user)

    expect(attributes).to be_kind_of(Hash)

    expect(attributes[:first_name]).to eq("Maxence")
    expect(attributes[:last_name]).to eq("Lenoir")
    expect(attributes[:email]).to eq("Maxence@hey.com".downcase)
    # assert_equal "Alexandre",         attributes[:first_name]
    # assert_equal "Ruban",             attributes[:last_name]
    # assert_equal "alexandre@hey.com", attributes[:email]
  end

  it "test_build" do
    user = build(:user)

    expect(user).to be_kind_of(User)
    expect(user.new_record?).to be_truthy

    expect(user.first_name).to eq("Maxence")
    expect(user.last_name).to eq("Lenoir")
    expect(user.email).to eq("Maxence@hey.com".downcase)
  #   assert_kind_of User, user
  #   assert user.new_record?

  #   assert_equal "Alexandre",         user.first_name
  #   assert_equal "Ruban",             user.last_name
  #   assert_equal "alexandre@hey.com", user.email
  end

  it "test_create" do
    user = create(:user)

    expect(user).to be_kind_of(User)
    expect(user.persisted?).to be_truthy

    expect(user.first_name).to eq("Maxence")
    expect(user.last_name).to eq("Lenoir")
    expect(user.email).to eq("Maxence@hey.com".downcase)
  #   assert_kind_of User, user
  #   assert user.persisted?

  #   assert_equal "Alexandre",         user.first_name
  #   assert_equal "Ruban",             user.last_name
  #   assert_equal "alexandre@hey.com", user.email
  end
end