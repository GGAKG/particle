const express = require('express');
const app = express();

function getClientIp(req) {
  const xff = req.headers['x-forwarded-for'];
  if (xff) {
    const first = xff.split(',')[0].trim();
    if (first) return first;
  }

  if (req.headers['x-real-ip']) {
    return req.headers['x-real-ip'];
  }

  return req.ip || req.connection.remoteAddress || '0.0.0.0';
}
app.get('/app/health', (req, res) => res.json({ status: 'ok' }));
app.get('/app', (req, res) => {
  const now = new Date().toISOString();
  const ip = getClientIp(req);

  res.json({
    timestamp: now,
    ip: ip
  });
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`SimpleTimeService running on port ${port}`);
});