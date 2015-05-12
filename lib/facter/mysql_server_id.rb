Facter.add(:mysql_server_id) do
  setcode do
    require 'md5'
    value = MD5.md5(Facter.value(:hostname))
    # Hope you don't get a collision!
    value.to_s.gsub(/\D/, '')[0...9]
  end
end
