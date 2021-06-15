FactoryBot.define do

  factory :user do
    name {'tokyo'}
    email {'tokyo@tokyo.com'}
    password {'123qwe'}
    admin {false}
  end

  factory :user2, class: User do
    name {'osaka'}
    email {'osaka@osaka.com'}
    password {'123qwe'}
    password_confirmation {'123qwe'}
    admin {false}
  end

  factory :admin_user, class: User do
    name {'admin'}
    email {'admin-guest@admin-guest.com'}
    password {'123qwe'}
    password_confirmation {'123qwe'}
    admin {true}
  end

  factory :admin_user2, class: User do
    name {'admin2'}
    email {'admin-guest2@admin-guest2.com'}
    password {'123qwe'}
    password_confirmation {'123qwe'}
    admin {true}
  end

end
