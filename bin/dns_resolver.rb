require 'socket'

UDP_HOST = "8.8.8.8"
UDP_PORT = 53

s1 = UDPSocket.new
s1.bind(UDP_HOST, UDP_PORT)
u1.send "message-to-self", 0, UDP_HOST, UDP_PORT
p u1.recvfrom(10) #=> ["message-to", ["AF_INET", UDP_PORT, "localhost", UDP_HOST]]
