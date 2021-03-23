TARGET   = JavaDriverTest.jar

JFLAGS=-g --release 8
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

.PHONY: clean-build
clean-build:
	@$(RM) $(OBJECTS)
	@echo "Cleanup complete!"

.PHONY: remove
clean: clean-build
	@$(RM) $(JARDIR)/$(TARGET)
	@echo "Jar file removed!"