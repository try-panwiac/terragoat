def foo():
  user_input = request.cookies['user']
  decoded = b64decode(user_input)
  sanitized = verify_safe(decoded)
  # ok: hooray-taint-mode-sanitizer
  return 'Hey {}!'.format(pickle.loads(sanitized))
