TARGET   = JavaDriverTest.jar

JFLAGS=-g --release 10
JC=javac
JAR=jar

SRCDIR   = src
CLASSDIR = build
JARDIR   = jar

SOURCES  := $(wildcard $(SRCDIR)/*.java)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.java=$(CLASSDIR)/%.class)


$(OBJECTS): $(CLASSDIR)/%.class : $(SRCDIR)/%.java
	@$(JC) $(JFLAGS) -d $(@D) $< 
	@echo "Compiled "$<" successfully!"

$(JARDIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(JARDIR)
	@$(JAR) --create --file $@ -C $(CLASSDIR) $(subst $(CLASSDIR)/,,$(OBJECTS))
	@echo "Created "$@" succesfully!"

jar: $(JARDIR)/$(TARGET)

.PHONY: clean
clean:
	@$(RM) $(OBJECTS)
	@echo "Cleanup complete!"

.PHONY: remove
remove: clean
	@$(RM) $(JARDIR)/$(TARGET)
	@echo "Executable removed!"