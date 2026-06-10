#!/bin/bash

# Reorganize rainfall repository structure
# Moves all notebooks and data folder into notebooks/ directory

echo "🚀 Starting repository reorganization..."

# Create notebooks directory if it doesn't exist
if [ ! -d "notebooks" ]; then
    echo "📁 Creating notebooks/ directory..."
    mkdir notebooks
else
    echo "📁 notebooks/ directory already exists"
fi

# Move all .ipynb files to notebooks/
echo "📓 Moving Jupyter notebooks..."
mv *.ipynb notebooks/ 2>/dev/null || echo "⚠️  No .ipynb files found in root"

# Move data folder to notebooks/
if [ -d "data" ]; then
    echo "📊 Moving data/ folder..."
    mv data notebooks/data
else
    echo "⚠️  data/ folder not found"
fi

# Move .textClipping file if exists
if [ -f "*.textClipping" ]; then
    echo "📄 Moving .textClipping files..."
    mv *.textClipping notebooks/ 2>/dev/null
fi

echo ""
echo "✅ Reorganization complete!"
echo ""
echo "📋 New structure:"
echo "rainfall/"
echo "├── README.md"
echo "├── requirements.txt"
echo "├── LICENSE"
echo "├── .gitignore"
echo "└── notebooks/"
echo "    ├── data/"
echo "    └── [all .ipynb files]"
echo ""
echo "🔧 Next steps:"
echo "   1. git add ."
echo "   2. git commit -m 'Reorganize: move notebooks and data into notebooks/ folder'"
echo "   3. git push origin main"
