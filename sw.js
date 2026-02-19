// Service Worker v2 - Force no-cache on all requests
const VERSION = 'v2';

self.addEventListener('install', () => self.skipWaiting());

self.addEventListener('activate', (e) => {
    e.waitUntil(
        caches.keys()
            .then(keys => Promise.all(keys.map(k => caches.delete(k))))
            .then(() => self.clients.claim())
            .then(() => {
                // Tell all open tabs to reload
                self.clients.matchAll({ type: 'window' }).then(clients => {
                    clients.forEach(client => client.navigate(client.url));
                });
            })
    );
});

self.addEventListener('fetch', (e) => {
    e.respondWith(
        fetch(e.request, { cache: 'no-store' }).catch(() => caches.match(e.request))
    );
});
