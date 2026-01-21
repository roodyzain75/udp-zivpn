import telebot, os
TOKEN="ISI_TOKEN"; ADMIN="ISI_ID"
b=telebot.TeleBot(TOKEN)

def ok(m): return str(m.from_user.id)==ADMIN

@b.message_handler(commands=['renew'])
def r(m):
    if ok(m):
        os.system("udp-renew")
        b.reply_to(m,"🔁 Renew sukses")

@b.message_handler(commands=['panel'])
def p(m):
    if ok(m):
        b.reply_to(m,"🌐 Panel: http://SERVER_IP/panel")

b.infinity_polling()

