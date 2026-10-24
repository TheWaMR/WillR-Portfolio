# thewamr.com

Hugo source for [thewamr.com](https://thewamr.com), Will Rohren's engineering portfolio.
Theme: [Dream](https://github.com/g1eny0ung/hugo-theme-dream), copied into `themes/hugo-theme-dream-master`.
Built with Hugo extended (currently 0.145).

## Editing

- Each project is a folder: `content/posts/<Project>/index.md`, with photos in an `Images/` subfolder and clips in `Videos/`.
- Front matter that matters:
  - `title`, `date`, `lastmod` (shown as "Updated at", so bump it when you edit)
  - `description`: one or two sentences with the outcome and numbers. This is the card text on the homepage and the snippet in search results and link previews.
  - `cover`: the card image and the photo at the top of the page. `images`: the link-preview image (usually the same file).
  - `weight`: lower numbers sort higher on the homepage. `draft: true` hides a page from the live site.
  - `categories` and `tags`: see the list below.
- Images in the text: `![caption](Images/photo.jpg)` with an italic caption line under it. Filenames are case-sensitive on the live site even though Windows is not, so match the case exactly.
- Collapsible sections: `{{< details "**Heading**" >}} ... {{< /details >}}`.
- Video: `{{< video src="Videos/clip.mp4" width="800" >}}`. Add `autoplay="true" loop="true"` for short silent clips (they play muted).
- New project page: `hugo new posts/My_Project/index.md`, then fill in the front matter and set `draft: false` when it is ready.

## Previewing

```
hugo server -D
```

Open http://localhost:1313. `-D` includes drafts. Ctrl+C stops the server.

## Images and video

Keep photos at or below 2000 px on the long side and videos at 1080p or less before adding them. With ImageMagick and ffmpeg installed:

```
magick mogrify -auto-orient -resize "2000x2000>" -quality 85 *.jpg
ffmpeg -i clip_original.mp4 -vf scale=-2:1080 -c:v libx264 -crf 27 -preset slow -c:a aac -movflags +faststart clip.mp4
```

Full-resolution originals of anything shrunk for the site, plus unused photos that were removed from the post folders, are in `..\_archive\` (outside this repo).

## Deploying

The live site is served by GitHub Pages from the `thewamr.github.io` repo, which is checked out next to this folder at `..\thewamr.github.io`. To publish:

```
hugo --cleanDestinationDir
robocopy public ..\thewamr.github.io /MIR /XD .git
cd ..\thewamr.github.io
git add -A
git commit -m "Deploy"
git push
```

Then commit and push this source repo too, so the source on GitHub matches the live site.

## Tags and categories

Keep these consistent across pages.

- Categories: Electronics, Mechanical, Aerospace, Shop, Personal, Photography, Tech
- Skills and tools: PCB Design, Altium, KiCAD, SolidWorks, Ansys, Femap, FEA, Topology Optimization, CAD, CNC Machining, Plasma Cutting, 3D Printing, Sheet Metal, Aluminum Extrusion, Soldering, Hand Assembly
- Topics: Microcontroller, Bare-Metal, ATmega32U4, ESP32, Arduino, USB-C, I2C, Stepper Motors, Shift Register, Battery Management, Power Electronics, Mixed-Signal, Binder Jet, Autoclave, CoreXY, Structures, Balsa, Aerodynamics
- Context: JLCPCB, Texas A&M, SAE Aero, RPS, Lab Project, Personal Project, Documentation
- Status: Complete, In Progress, Shelved, Handed Off

## Changelog

- 10/23/26: cleanup pass. Archived unused media and old resumes, set the site URL and metadata for link previews, added name, tagline, Resume and Email links to the header, card descriptions and new ordering for every project, shrank the largest images, moved the deploy checkout out of the source folder, added this README and a .gitignore.
- 5/11/26: content and structure overhaul. Rewrote every page, cleaned up front matter, categories, tags and weights, added the SAE Aero page, overhauled PBA.
- 9/4/25: major content update. Fixed categories and tags, moved images into folders, added weights, new resume, added PBA, SAE Aero, StarTracker V2 drafts.
- 4/21/25: updated resume, fixed dates.
- 3/8/25: initial portfolio: A4988, alarm clock, ATmega32U4 dev board, battery charger, LF3DP, PC, photography, plasma cutter.
