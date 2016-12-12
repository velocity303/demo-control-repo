Facter.add(:location) do
  setcode do
    domain = Facter.value(:networking)['domain']
    domain.chomp(".lab")
  end
end
