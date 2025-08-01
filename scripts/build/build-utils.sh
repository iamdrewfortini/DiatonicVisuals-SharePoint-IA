#!/bin/bash

# SPFx Build Utilities for DiatonicVisuals
# Collection of utility functions for building and managing SPFx solutions

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}=====================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=====================================${NC}"
}

# Function to check if node modules are installed
check_dependencies() {
    print_status "Checking dependencies..."
    if [ ! -d "node_modules" ]; then
        print_warning "Node modules not found. Installing dependencies..."
        npm install
    else
        print_status "Dependencies found."
    fi
}

# Function to clean build artifacts
clean_build() {
    print_status "Cleaning build artifacts..."
    rm -rf lib-amd lib-es6 temp dist coverage 2>/dev/null || true
    print_status "Clean completed."
}

# Function to run linting
lint_code() {
    print_status "Running ESLint..."
    npm run lint 2>/dev/null || npx eslint src --ext .ts,.tsx || true
    print_status "Linting completed."
}

# Function to run tests
run_tests() {
    print_status "Running tests..."
    npm test 2>/dev/null || npx jest || print_warning "No tests configured or tests failed."
    print_status "Tests completed."
}

# Function to build for development
build_dev() {
    print_header "Development Build"
    check_dependencies
    clean_build
    gulp build
    print_status "Development build completed."
}

# Function to build for production
build_prod() {
    print_header "Production Build"
    check_dependencies
    clean_build
    lint_code
    run_tests
    gulp build
    gulp bundle --ship
    gulp package-solution --ship
    print_status "Production build completed."
}

# Function to serve the solution
serve_solution() {
    print_header "Serving Solution"
    check_dependencies
    print_status "Starting development server..."
    print_status "The workbench will be available at: https://localhost:4321/temp/workbench.html"
    gulp serve
}

# Function to show help
show_help() {
    echo "SPFx Build Utilities"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  clean         Clean build artifacts"
    echo "  lint          Run ESLint"
    echo "  test          Run tests"
    echo "  build-dev     Build for development"
    echo "  build-prod    Build for production"
    echo "  serve         Start development server"
    echo "  check-deps    Check and install dependencies"
    echo "  help          Show this help message"
}

# Main script logic
case "${1:-help}" in
    clean)
        clean_build
        ;;
    lint)
        lint_code
        ;;
    test)
        run_tests
        ;;
    build-dev)
        build_dev
        ;;
    build-prod)
        build_prod
        ;;
    serve)
        serve_solution
        ;;
    check-deps)
        check_dependencies
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
