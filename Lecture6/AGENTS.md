# LaTeX Beamer Presentation Guidelines

These rules apply whenever creating or modifying LaTeX Beamer slides.

## General principles

- Slides are for live lectures and conference presentations,
  not for reading as standalone documents.
- Prioritize clarity, mathematical precision, and readability.
- One main idea per slide.
- Prefer several simple slides over one overcrowded slide.
- Do not try to reproduce the full content of a paper on slides.

## Content density

- Minimize text. Use short phrases rather than complete sentences.
- Aim for at most 3–4 bullet points per slide.
- Avoid nested bullet lists.
- Avoid long paragraphs.
- If content does not fit comfortably, split it into multiple slides.
- Never reduce font size just to make content fit.
- Do not use negative vertical spacing to squeeze content.

## Mathematical content

- Preserve mathematical correctness and precise notation.
- Prefer formulas, diagrams, and examples over verbal descriptions.
- Introduce notation before using it.
- Avoid putting a long definition, theorem, and proof on one slide.
- For complicated proofs, present the main idea and steps only. I use blackbord for details
- Do not oversimplify mathematical statements.

## Visual layout

- Avoid excessive use of Beamer blocks.
- Do not stack multiple blocks unless necessary.
- Use blocks only when they communicate a meaningful distinction.
- Prefer simple layouts with substantial whitespace.
- Align mathematical expressions and diagrams consistently.
- Avoid unnecessary decorative elements.
- Respect the existing presentation theme and style.

## Beamer-specific guidelines

- Avoid \small, \footnotesize, and \scriptsize in normal slide content.
- Avoid \resizebox as a way to fit excessive content.
- Use overlays only when they improve the explanation.
- Prefer TikZ diagrams for automata, graphs, and constructions.
- Keep diagrams simple and readable.

## Mandatory quality control

After modifying slides:

1. Compile the LaTeX document.
2. Check for overfull boxes and compilation warnings.
3. Render the resulting PDF pages and inspect them visually.
4. Verify that:
   - no content extends beyond slide boundaries;
   - text and mathematical expressions are readable;
   - slides are not overcrowded;
   - spacing and alignment are visually balanced.
5. Correct all identified problems before finishing.

IMPORTANT:
A slide that compiles successfully is not necessarily a good slide.
Visual inspection is required.

If a slide is overcrowded, SPLIT IT.
Do not solve the problem by shrinking its contents.