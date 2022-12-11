if string.sub(getfenv()["script"].Name, -1, -9) ~= "This is secret. No peeking!" then
  error("Script must be launched from loader!")
  return nil;
end
