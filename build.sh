#!/bin/bash

MAIN_BRANCH="main"
PROJECT_NAME="Coverage demo"
PROJECT_KEY="demo:coverage"

log () {
	echo "================================================================================"; echo
	echo $*
	echo; echo "================================================================================"
}

git checkout "$MAIN_BRANCH"

for branch in "$MAIN_BRANCH" partial-coverage-1 partial-coverage-2 four-conds hybrid-coverage
do
	git checkout "$branch"
	branchOpt=""
	if [ "$branch" != "$MAIN_BRANCH" ]; then
		branchOpt="-Dsonar.branch.name=$branch"
	fi
	log "Building, Testing and Analyzing branch $branch"
	mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent install org.jacoco:jacoco-maven-plugin:report \
		-Dmaven.test.failure.ignore=true \
		sonar:sonar $branchOpt \
		-Dsonar.exclusions=pom.xml \
		-Dsonar.projectKey="$PROJECT_KEY" -Dsonar.projectName="$PROJECT_NAME" $*
done

# Return to master branch after analysis of other branches
git checkout "$MAIN_BRANCH"
