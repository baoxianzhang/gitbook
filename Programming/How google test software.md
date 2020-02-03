# How google test software

\1. An open-source version of Mondrian hosted on App Engine is publicly avalible at http://code.google.com/p/rietveld

\2. Google's protocol buffers are open sourced; see http::code.google.com/apis/protocolbuffers/

\3. Reviewing design documents should be done with purpose and not just be a general breeze through, as though you are reading a newspaper. A good SET is purposeful during his review. Here are some things we recommend:

• Completeness: Identify parts of the document that are incomplete or that require special knowledge not generally available on the team, par-

ticularly to new members of the team. Encourage the document’s author to write more details or link to other documentation that fill in these gaps.

• Correctness: Look for grammar, spelling, and punctuation mistakes; this is sloppy work that does not bode well for the code they will write

later. Don’t set a precedent for sloppiness. 

• Consistency: Ensure that wording matches diagrams. Ensure that the document does not contradict claims made in other documents.

• Design: Consider the design proposed by the document. Is it achievable given the resources available? What infrastructure does it propose

to build upon? (Read the documentation of that infrastructure and learn its pitfalls.) Does the proposed design make use of that infrastruc-

ture in a supported way? Is the design too complex? Is it possible to simplify? Is it too simple? What more does the design need to address?

• Interfaces and protocols: Does the document clearly identify the protocols it will use? Does it completely describe the interfaces and protocols

that the product will expose? Do these interfaces and protocols accomplish what they are meant to accomplish? Are they standard across

other Google products? Can you encourage the developer to go one step further and define his protocol buffers? (We discuss more about

protocol buffers later.)

• Test ing: How testable is the system or set of systems described by the document? Are new testing hooks required? If so, ensure those get

added to the documentation. Can the design of the system be tweaked to make testing easier or use pre-existing test infrastructure? Estimate

what must be done to test the system and work with the developer to have this information added to the design document.

\4. Google takes code reviews seriously, and, especially with common code, developers must have all their code reviewed by someone with a

“readability” in the relevant programming language. Acommittee grants readabilities after a developer establishes a good track record for

writing clean code which adheres to style guidelines. Readabilities exist for C++, Java, Python, and JavaScript: Google’s four primary lan-

guages.