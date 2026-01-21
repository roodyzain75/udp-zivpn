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

from telebot import types

def menu(chat_id):
    kb = types.InlineKeyboardMarkup()
    kb.add(
        types.InlineKeyboardButton("➕ Add User", callback_data="add"),
        types.InlineKeyboardButton("⏳ Trial", callback_data="trial")
    )
    kb.add(
        types.InlineKeyboardButton("📋 List", callback_data="list"),
        types.InlineKeyboardButton("♻ Renew", callback_data="renew")
    )
    bot.send_message(chat_id, "UDP ZIVPN PRO++ MENU", reply_markup=kb)
    
