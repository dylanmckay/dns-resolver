#! /usr/bin/ruby

require 'socket'
require_relative '../lib/packet'

UDP_HOST = "8.8.8.8"
UDP_PORT = 53

# Usage
# dns-resolver <domain>
#

def kill(msg = nil)
  puts "Error: #{msg}" if msg
  print_usage
end

def print_usage
  puts "dns-resolver <domain>"
end

def resolve(domain)
  socket = connect_to_nameserver

  header = Header.new
  packet = Packet.new(header, nil, nil, nil, nil, nil)

  # socket.send packet.data
  # u1.send "message-to-self", 0, UDP_HOST, UDP_PORT
  # p u1.recvfrom(10)
end

def connect_to_nameserver(ip = UDP_HOST, port = UDP_PORT)
  socket = UDPSocket.new
  socket.bind(ip, port)

  socket
end

def main
  kill("no domain given") if ARGV[0].nil?

  domain = ARGV[0]
end

main
