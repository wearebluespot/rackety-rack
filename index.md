---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
---

Contact form
------------

<form method="post" action="/contact">
  <div>
    <label for="reply_to">Email address</label>
    <input required type="email" name="reply_to">
  </div>

  <div>
    <label for="subject">Subject</label>
    <input required type="text" name="subject">
  </div>

  <div>
    <label for="body">Message</label>
    <textarea required name="body"></textarea>
  </div>

  <button>Send</button>
</form>
