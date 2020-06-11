FactoryBot.define do
  factory(:quote) do
    quote {"a whole bunch of words"}
    author {"michael"}
  end
end

# ---------- from other project
# FactoryBot.define do 
#   factory(:review) do
#     user_name {'guy'}
#     rating {5}
#     country {'spain'}
#     city {'madrid'}
#     content {'stuff stuff stuff'}
#   end
# end