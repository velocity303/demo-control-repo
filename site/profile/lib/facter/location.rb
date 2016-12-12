Facter.add(:location) do
  setcode do
    domain = Facter.value(:networking.['domain'])
    domain.split(".",1)
  end
end
