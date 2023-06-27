const { parseString } = require('xml2js');

const channelName = 'YourChannelName';
const channelURL = `http://gdata.youtube.com/feeds/api/users/${channelName}/uploads`;

(async () => {
  const fetch = await import('node-fetch');

  fetch.default(channelURL)
    .then(res => res.text())
    .then(xml => {
      parseString(xml, (err, result) => {
        if (err) {
          console.error(err);
          return;
        }

        const entries = result.feed.entry;
        for (let i = 0; i < entries.length; i++) {
          const link = entries[i].id[0];
          const video_id = link.split('/').pop();
          const iframe = `<iframe src="//www.youtube.com/embed/${video_id}"></iframe>`;
          console.log(iframe.toString());
        }
      });
    })
    .catch(err => console.error(err));
})();
