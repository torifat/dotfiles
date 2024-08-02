// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  // defaultBrowser: "Safari",
  defaultBrowser: "Google Chrome",
  rewrite: [
    {
      match: "go/*",
      url: "https://go.atlassian.com",
    },
  ],
  handlers: [
    {
      // Open work related websites in my default work profile
      match: ["bitbucket.org/atlassian/*", "*.atlassian.net/*"],
      browser: {
        name: "Google Chrome",
        // Work profile
        profile: "Default",
      },
    },
    {
      match: ["twitter.com/*", "*.amazon.com.au/*", "amzn.asia/*", "*.templeandwebster.com.au/*", "*.carpetcall.com.au/*"],
      browser: "Safari",
    },
  ],
};
