from flask import Flask, render_template, request, flash, redirect, url_for
from colp.contact.form import ContactForm
from colp import app
from flask_mail import Mail, Message

mail = Mail()

app.config["MAIL_SERVER"] = "smtp.gmail.com"
app.config["MAIL_PORT"] = 465
app.config["MAIL_USE_SSL"] = True
app.config["MAIL_USERNAME"] = 'eng.hassanemam@gmail.com'
app.config["MAIL_PASSWORD"] = '035480551'
 
mail.init_app(app)

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    form = ContactForm()
 
    if request.method == 'POST':
        if form.validate() == False:
          flash('All fields are required.', 'alert-danger')
          return render_template('contact.html', form=form)
        else:
            msg = Message(form.subject.data, sender='contact@example.com', recipients=['eng.hassanemam@gmail.com'])
            msg.body = """
            From: %s <%s>
            %s
            """ % (form.name.data, form.email.data, form.message.data)
            mail.send(msg)
            flash('Message has been sent successfully ', 'alert-success')
            return redirect(url_for('contact'))
 
    elif request.method == 'GET':
        return render_template('contact/contact.html', form=form)