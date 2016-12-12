Facter.add(:location) do
  setcode do
    domain = Facter.value(:networking)['domain']
    location = domain.split(".",1)
  end
  location
end
