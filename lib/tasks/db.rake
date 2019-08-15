namespace :db do
  desc "Drop, create, migrate then reseed development database"
  task reseed: ["db:drop", "db:create", "db:migrate", "db:seed"] do
    puts "Reseeding complete"
  end
end
